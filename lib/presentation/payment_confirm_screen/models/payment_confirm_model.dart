import 'list_item_model.dart';

/// This class defines the variables used in the [payment_confirm_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PaymentConfirmModel {
  // Rx<List<ListItemModel>> listItemList =
  //     Rx(List.generate(10, (index) => ListItemModel()));

  static List<ListItemModel> getMessegeList() {
    return [
      ListItemModel("It is a long established fact that a reader.", "2 Min"),
      ListItemModel("What do you mean by insurance.", "12 Min"),
      ListItemModel("Who is insurance and in short.", "2 Min"),
      ListItemModel("It is a long established fact that a reader.", "22 Min"),
      ListItemModel("What is the type of insurance.", "25 Min"),
      ListItemModel("What is risk in insurance.", "48 Min"),
      ListItemModel("What are benefits of insurance.", "59 Min"),
      ListItemModel("What is an example of insurance.", "2 hour"),
      ListItemModel("What is double insurance.", "3 hour"),
      ListItemModel("Which was the first insurance in India?", "4 hour"),
    ];
  }
}
