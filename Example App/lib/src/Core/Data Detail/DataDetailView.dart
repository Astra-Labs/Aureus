part of AureusTestingApp;

class AureusDataDetailView extends DataDetailView {
  AureusDataDetailView()
      : super(title: 'Testing', detailCards: [
          TextViewDataCardElement(
              dataLabel: "Testing",
              textEditingController: TextEditingController())
        ]);
}
