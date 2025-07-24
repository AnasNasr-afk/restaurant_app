abstract class MenuStates {}

class MenuInitialState extends MenuStates {}

class MenuLoadingState extends MenuStates {}

class MenuSuccessState extends MenuStates {}

class MenuErrorState extends MenuStates {}

class CartUpdatedState extends MenuStates {}

class CartLoadingState extends MenuStates {}

class CartErrorState extends MenuStates {
  final String error;
  CartErrorState(this.error);
}