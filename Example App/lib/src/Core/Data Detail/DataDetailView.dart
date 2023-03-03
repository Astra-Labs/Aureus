part of AureusTestingApp;

// These UI components are under development, so are not public for use
// as of right now.

class AureusDataDetailView extends DataDetailView {
  AureusDataDetailView()
      : super(
          title: 'Testing',
          detailCards: [
            DataDetailList().addressCard,
            DataDetailList().textFieldCard,
            DataDetailList().textViewCard,
            DataDetailList().promptListCard,
          ],
        );
}
