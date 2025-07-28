import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/buildtextfield.dart';

void main() => runApp(MaterialApp(home: EmploymentFormPage()));

@RoutePage()
class EmploymentFormPage extends StatefulWidget {
  @override
  _EmploymentFormPageState createState() => _EmploymentFormPageState();
}

class _EmploymentFormPageState extends State<EmploymentFormPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime(2023, 9, 22);

  // Form fields
  String employmentType = 'Full-time';
  String employer = 'Apple Inc';
  String jobTitle = 'Software engineer';
  String income = '150000';
  String payFrequency = 'Bi-weekly';
  DateTime nextPayday = DateTime(2023, 9, 22);
  bool isDirectDeposit = true;
  String employerAddress = 'Apple One Apple Park Way, Cupertino, CA 95014';
  int yearsWithEmployer = 1;
  int monthsWithEmployer = 3;

  bool submitted = false;
  bool isEditing = false;

  void _edit() {
      setState(() => isEditing = true);
  }

  void _continue() {
    setState(() => isEditing = false);
  }

  void _confirm() {
    if (_formKey.currentState!.validate()) {
      context.router.pop();
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: const SizedBox(),
          icon: Icon(
            Icons.arrow_back,
          )
        )
      ),
      resizeToAvoidBottomInset: true,
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    final formattedDate = DateFormat("MMM d'th', yyyy (EEEE)").format(_selectedDate);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEditing ? "Edit employment information" : "Confirm your employment",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFF2A1E39),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Employment Type
                    isEditing ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employment type",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        DropdownButtonFormField<String>(
                          value: employmentType,
                          icon: Icon(Icons.arrow_drop_down),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          items: ['Full-time', 'Part-time', 'Contractor']
                              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (val) => setState(() => employmentType = val!),
                        ),
                      ],
                    )
                    : buildTextField("Employment type", employmentType),

                    // Employer
                    isEditing ?
                    buildEditField("Employer", employer, (val) => employer = val)

                    :
                    buildTextField("Employer", employer),

                    // Job Title
                    isEditing ?
                    buildEditField("Job title", jobTitle, (val) => jobTitle = val)
                    :
                    buildTextField("Job title", jobTitle),

                    isEditing?
                    buildEditField("Gross annual income", income, (val) => income = val)
                    :
                    buildTextField("Gross annual income", '\$$income/year'),

                    isEditing ?
                    buildDropDownField("Pay frequency", payFrequency, ['Weekly', 'Bi-weekly', 'Monthly'], (val) => payFrequency = val!)
                    :
                    buildTextField("Pay frequency", payFrequency),

                    isEditing ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My next payday is',
                          style: TextStyle(
                            color: Color(0xFF2A1E39),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      formattedDate,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 16,
                                    color: Colors.grey[700],
                                  ),
                                ],
                              ),
                            )
                        ),
                      ],
                    )
                    :
                    buildTextField("Next payday", formattedDate),

                    isEditing ?
                    // Direct Deposit
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Is your pay a direct deposit?',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: isDirectDeposit,
                              onChanged: (val) => setState(() => isDirectDeposit = val as bool),
                            ),
                            Text('Yes'),
                            Radio(
                              value: false,
                              groupValue: isDirectDeposit,
                              onChanged: (val) => setState(() => isDirectDeposit = val as bool),
                            ),
                            Text('No'),
                          ],
                        ),
                      ],
                    )
                    :
                    buildTextField("Is your pay a direct deposit?", isDirectDeposit ? 'Yes' : 'No'),

                    isEditing ?
                    // Employer Address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employer address',
                          style: TextStyle(
                            color: Color(0xFF2A1E39),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          maxLines: 2,
                          initialValue: employerAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (val) => employerAddress = val,
                        ),
                      ],
                    )
                    :
                    buildTextField("Employer address", employerAddress),

                    isEditing ?
                    // Time with employer
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time with employer",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                value: yearsWithEmployer,
                                icon: Icon(Icons.arrow_drop_down),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                items: List.generate(11, (i) => DropdownMenuItem(value: i, child: Text('$i year${i == 1 ? '' : 's'}'))),
                                onChanged: (val) => setState(() => yearsWithEmployer = val!),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                value: monthsWithEmployer,
                                icon: Icon(Icons.arrow_drop_down),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                items: List.generate(12, (i) => DropdownMenuItem(value: i, child: Text('$i month${i == 1 ? '' : 's'}'))),
                                onChanged: (val) => setState(() => monthsWithEmployer = val!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                    :
                    buildTextField("Time with employer", '$yearsWithEmployer year${yearsWithEmployer == 1 ? '' : 's'} $monthsWithEmployer month${monthsWithEmployer == 1 ? '' : 's'}'),

                    SizedBox(height: 20),

                    !isEditing ?
                      Column(
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                _edit();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Color(0xFF420085),
                                    width: 2,
                                  ),
                                ),
                                minimumSize: Size(300, 45), // Width and height like the image
                                ),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color(0xFF420085),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                _confirm();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF420085), // Soft gray background (adjust as needed)
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Rounded edges
                                ),
                                minimumSize: Size(300, 45), // Width and height like the image
                              ),
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF), // Matching text color from image
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                    :
                      // once press edit, allow continue
                    Column(
                      children: [
                        Center(
                          child: TextButton(
                            onPressed: () {
                              _continue();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFD9D5DC), // Soft gray background (adjust as needed)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Rounded edges
                              ),
                              minimumSize: Size(300, 45), // Width and height like the image
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Color(0xFF5E556C), // Matching text color from image
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
