import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/car_insurance_screen/models/car_insurance_details_model.dart';

class CustomDropSearchWidget extends StatefulWidget {
  final OverlayPortalController overlayPortalController;
  final Function(Brand) onItemSelected;
  final List<Brand> items;

  const CustomDropSearchWidget({
    super.key,
    required this.overlayPortalController,
    required this.onItemSelected,
    required this.items,
  });

  @override
  State<CustomDropSearchWidget> createState() => _CustomDropSearchWidgetState();
}

class _CustomDropSearchWidgetState extends State<CustomDropSearchWidget> {
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<Brand> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);

    _controller.addListener(() {
      filterItems(_controller.text);
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widget.overlayPortalController.show();
      }
    });
  }

  void filterItems(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              (item.name ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              fillColor: Colors.grey[200],
              filled: true,
              hint: Text(
                "lbl_car_brand".tr,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        portal(),
      ],
    );
  }

  OverlayPortal portal() {
    return OverlayPortal(
      controller: widget.overlayPortalController,
      overlayChildBuilder: (context) {
        return CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              constraints: const BoxConstraints(maxHeight: 200),
              margin: getMargin(right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _filteredItems.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            final selectedItem = _filteredItems[index];
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _controller.text = selectedItem.name ?? '';
                              widget.onItemSelected(selectedItem);
                              widget.overlayPortalController.hide();
                              _focusNode.unfocus();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(_filteredItems[index].name ?? ''),
                          ),
                        );
                      },
                    )
                  : const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('No results found'),
                    ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:insurance_app/core/app_export.dart';

// class CustomDropSearchWidget extends StatefulWidget {
//   final OverlayPortalController overlayPortalController;
//   final Function(String) onItemSelected;

//   const CustomDropSearchWidget({
//     super.key,
//     required this.overlayPortalController,
//     required this.onItemSelected,
//   });

//   @override
//   State<CustomDropSearchWidget> createState() => _CustomDropSearchWidgetState();
// }

// class _CustomDropSearchWidgetState extends State<CustomDropSearchWidget> {
//   final LayerLink _layerLink = LayerLink();
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _focusNode = FocusNode();

//   final List<String> _menuItems = [
//     'Acura',
//     'Alfa Romeo',
//     'Aston Martin',
//     'Audi',
//     'Bentley',
//     'BMW',
//     'Bugatti',
//     'Buick',
//     'BYD',
//     'Cadillac',
//     'Chery',
//     'Chevrolet',
//     'Chrysler',
//     'Citroën',
//     'Dodge',
//     'DS Automobiles',
//     'Ferrari',
//     'Fiat',
//     'Ford',
//     'Genesis',
//     'Geely',
//     'GMC',
//     'Great Wall Motors',
//     'Haval',
//     'Honda',
//     'Hyundai',
//     'Infiniti',
//     'Jaguar',
//     'Jeep',
//     'Kia',
//     'Lamborghini',
//     'Land Rover',
//     'Lancia',
//     'Lexus',
//     'Li Auto',
//     'Lincoln',
//     'Lotus',
//     'Maserati',
//     'Mazda',
//     'McLaren',
//     'Mercedes-Benz',
//     'Mini',
//     'Mitsubishi',
//     'NIO',
//     'Nissan',
//     'Opel',
//     'Pagani',
//     'Peugeot',
//     'Porsche',
//     'Ram',
//     'Renault',
//     'Rolls-Royce',
//     'Subaru',
//     'Suzuki',
//     'Tesla',
//     'Toyota',
//     'Volkswagen',
//     'Volvo',
//     'XPeng',
//   ];
//   List<String> _filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredItems = List.from(_menuItems);

//     _controller.addListener(() {
//       filterItems(_controller.text);
//     });

//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus) {
//         widget.overlayPortalController.show();
//       }
//     });
//   }

//   void filterItems(String query) {
//     setState(() {
//       _filteredItems = _menuItems
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CompositedTransformTarget(
//           link: _layerLink,
//           child: TextField(
//             controller: _controller,
//             focusNode: _focusNode,
//             decoration: InputDecoration(
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//               fillColor: Colors.grey[200],
//               filled: true,
//               hint: Text(
//                 "lbl_car_brand".tr,
//                 style: const TextStyle(fontSize: 16, color: Colors.black),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.grey),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.grey),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//         portal(),
//       ],
//     );
//   }

//   OverlayPortal portal() {
//     return OverlayPortal(
//       controller: widget.overlayPortalController,
//       overlayChildBuilder: (context) {
//         return CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: const Offset(0, 60),
//           child: Material(
//             elevation: 4,
//             borderRadius: BorderRadius.circular(8),
//             child: Container(
//               width: MediaQuery.of(context).size.width - 32,
//               constraints: const BoxConstraints(maxHeight: 200),
//               margin: getMargin(right: 28),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey.shade300),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: _filteredItems.isNotEmpty
//                   ? ListView.builder(
//                       padding: EdgeInsets.zero,
//                       itemCount: _filteredItems.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             final selectedItem = _filteredItems[index];
//                             WidgetsBinding.instance.addPostFrameCallback((_) {
//                               _controller.text = selectedItem;
//                               widget.onItemSelected(selectedItem);
//                               widget.overlayPortalController.hide();
//                               _focusNode.unfocus();
//                             });
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(_filteredItems[index]),
//                           ),
//                         );
//                       },
//                     )
//                   : const Padding(
//                       padding: EdgeInsets.all(12.0),
//                       child: Text('No results found'),
//                     ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }
// }
