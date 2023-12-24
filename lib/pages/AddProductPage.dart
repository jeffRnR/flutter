import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  bool hasVariants = false;
  List<String> variantNames = [];
  List<String> variantValues = [];
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Product',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {}            
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField('Product Name'),
              _buildInputField('Product Description', maxLines: 3),
              _buildImageInput(),
              _buildInputField('Product Category'),
              _buildInputField('Product Price', keyboardType: TextInputType.number),
              _buildInputField('Inventory Count', keyboardType: TextInputType.number),
              _buildVariantsCheckbox(),
              if (hasVariants) ..._buildVariantsInputs(),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  //logic to save product details goes here
                },
                child: Text('Save this Product', style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      floatingActionButton: isMenuOpen
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  isMenuOpen = false;
                });
              },
              child: Icon(Icons.close),
            )
          : null,
    );
  }

  Widget _buildInputField(String labelText, {TextInputType? keyboardType, int? maxLines, String? initialValue}) {
    TextEditingController controller = TextEditingController(text: initialValue);

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.3),
            blurRadius: 3,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildVariantsCheckbox() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.3),
            blurRadius: 3,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: hasVariants,
            onChanged: (value) {
              setState(() {
                hasVariants = value ?? false;
                if (!hasVariants) {
                  variantNames.clear();
                  variantValues.clear();
                }
              });
            },
          ),
          Text('Does the product have variants, like size or color?'),
        ],
      ),
    );
  }

  Widget _buildImageInput() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.3),
            blurRadius: 3,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text('Product Image'),
          SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  //logic to upload image from machine goes here
                },
                child: Text('Upload Image'),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  //logic to upload image from URL goes here
                },
                child: Text('Image URL'),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  //logic to upload video goes here
                },
                child: Text('Upload Video'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildVariantsInputs() {
    return List.generate(variantNames.length + 1, (index) {
      if (index < variantNames.length) {
        return Column(
          children: [
            _buildInputField('Variant Name', initialValue: variantNames[index]),
            _buildInputField('Variant Value', initialValue: variantValues[index]),
            SizedBox(height: 15),
          ],
        );
      } else {
        return Column(
          children: [
            _buildInputField('Variant Name'),
            _buildInputField('Variant Value'),
            SizedBox(height: 15),
          ],
        );
      }
    });
  }
}
