import 'package:flutter/material.dart';

class HeroSearch extends StatefulWidget {
  const HeroSearch({Key? key}) : super(key: key);

  @override
  State<HeroSearch> createState() => _HeroSearchState();
}

class _HeroSearchState extends State<HeroSearch> {
  bool isEasySearch = true;
  String? selectedBrand;
  String? selectedSeries;
  String? selectedModel;
  final TextEditingController serialNumberController = TextEditingController();

  // Dummy data untuk dropdown
  final List<String> brands = ['HP', 'Canon', 'Epson', 'Brother'];
  final List<String> series = ['LaserJet', 'DeskJet', 'OfficeJet'];
  final List<String> models = ['Pro 1000', 'Pro 2000', 'Pro 3000'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
            Colors.orange,
          ],
        ),
      ),
      child: Stack(
        children: [
          Container(color: Colors.black.withOpacity(0.3)),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _SearchTab(
                                title: '3-Step Easy Search®',
                                isActive: isEasySearch,
                                onTap: () =>
                                    setState(() => isEasySearch = true),
                              ),
                              _SearchTab(
                                title: 'Search by Serial Number',
                                isActive: !isEasySearch,
                                onTap: () =>
                                    setState(() => isEasySearch = false),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: isEasySearch
                                ? _buildEasySearch()
                                : _buildSerialSearch(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEasySearch() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _CustomDropdown(
                hint: '1. Printer Brand',
                value: selectedBrand,
                items: brands,
                onChanged: (value) {
                  setState(() {
                    selectedBrand = value;
                    selectedSeries = null;
                    selectedModel = null;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _CustomDropdown(
                hint: '2. Printer Series',
                value: selectedSeries,
                items: series,
                onChanged: selectedBrand != null
                    ? (value) {
                        setState(() {
                          selectedSeries = value;
                          selectedModel = null;
                        });
                      }
                    : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _CustomDropdown(
                hint: '3. Printer Model',
                value: selectedModel,
                items: models,
                onChanged: selectedSeries != null
                    ? (value) {
                        setState(() {
                          selectedModel = value;
                        });
                      }
                    : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: selectedModel != null
                ? () {
                    // Implementasi pencarian cartridge
                    print('Searching for cartridges...');
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            child: const Text('FIND CARTRIDGES'),
          ),
        ),
      ],
    );
  }

  Widget _buildSerialSearch() {
    return Column(
      children: [
        TextField(
          controller: serialNumberController,
          decoration: InputDecoration(
            hintText: 'Enter printer serial number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: serialNumberController.text.isNotEmpty
                ? () {
                    // Implementasi pencarian dengan serial number
                    print('Searching by serial number...');
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            child: const Text('SEARCH'),
          ),
        ),
      ],
    );
  }
}

class _SearchTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _SearchTab({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _CustomDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final void Function(String?)? onChanged;

  const _CustomDropdown({
    Key? key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              hint,
              style: TextStyle(
                color: onChanged != null ? Colors.grey[800] : Colors.grey[400],
              ),
            ),
          ),
          isExpanded: true,
          icon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[400],
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(item),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
