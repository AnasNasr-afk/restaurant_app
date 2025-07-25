
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/cart_screen/widgets/cart_header.dart';
import 'package:restaurant_app/features/cart_screen/widgets/cart_item_card.dart';
import 'package:restaurant_app/features/cart_screen/widgets/checkout_button.dart';
import 'package:restaurant_app/features/cart_screen/widgets/remove_all_button.dart';

import '../../core/components/components.dart';
import '../../core/themes/color_manager.dart';
import '../menu_screen/cubit/menu_cubit.dart';
import '../menu_screen/cubit/menu_states.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

String selectedTable = "Table 1";
List<String> tableOptions = [
  "Table 1",
  "Table 2",
  "Table 3",
  "Table 4",
  "Table 5",
];
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.94,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          CartHeader(),
          Expanded(
            child: BlocConsumer<MenuCubit, MenuStates>(
              listener: (context, state) {
                if (state is CartErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${state.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<MenuCubit>();
                if (state is CartLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.darkRedColor,
                    ),
                  );
                }

                if (cubit.cartItems.isEmpty) {
                  return buildEmptyCart();
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RemoveAllButton(),
                      const SizedBox(height: 20),
                      buildOrderDetails(cubit.cartItems),
                      const SizedBox(height: 30),
                      buildTableNumber(
                        selectedTable: selectedTable,
                        tableOptions: tableOptions,
                        onChanged: (newTable) {
                          if (newTable != null) {
                            setState(() {
                              selectedTable = newTable;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      buildPaymentDetails(cubit),
                      const SizedBox(height: 100),
                    ],
                  ),
                );
              },
            ),
          ),
          CheckoutButton(selectedTable: selectedTable,),
        ],
      ),
    );
  }
}
