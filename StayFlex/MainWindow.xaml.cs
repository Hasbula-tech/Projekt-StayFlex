using StayFlex2.View;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StayFlex2
{
  /// <summary>
  /// Interaction logic for MainWindow.xaml
  /// </summary>
  public partial class MainWindow : Window
  {
    public MainWindow()
    {
      InitializeComponent();

    }


    // Event für das Buchen-Button
    private void BookButton_Click(object sender, RoutedEventArgs e)
    {
      MessageBox.Show("Zimmer erfolgreich gebucht!", "Buchung", MessageBoxButton.OK, MessageBoxImage.Information);
    }

    // Event für das Öffnen des Burger-Menüs
    private void BurgerMenuButton_Click(object sender, RoutedEventArgs e)
    {
      BurgerMenuPopup.IsOpen = true;  // Popup öffnen
    }

    // Event für die Auswahl des Datums
    private void DatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
    {
      if (sender is DatePicker datePicker && datePicker.SelectedDate != null)
      {
        datePicker.Text = datePicker.SelectedDate.Value.ToString("dd.MM.yyyy");
      }
    }

    // Event für ComboBox-Auswahl
    private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
      ComboBox comboBox = sender as ComboBox;
      if (comboBox.SelectedIndex != 0) // Verhindert die Auswahl des 'Zimmerauswahl'-Platzhalters
      {
        comboBox.Foreground = System.Windows.Media.Brushes.Black;
      }
    }



    private void OpenZimmerAuswahl(object sender, RoutedEventArgs e)
    {

    }

    private void ZimmerSelectedHandler(string selectedZimmer)
    {

    }



    private void OpenCalendarStart(object sender, MouseButtonEventArgs e)
    {
      e.Handled = true;
      CalendarPopupStart.IsOpen = true;
    }

    private void Calendar_SelectedDateChangedStart(object sender, SelectionChangedEventArgs e)
    {
      if (CustomCalendarStart.SelectedDate.HasValue)
      {
        CustomDatePickerComboBoxStart.Text = CustomCalendarStart.SelectedDate.Value.ToString("dd.MM.yyyy");
        CustomDatePickerComboBoxStart.Foreground = System.Windows.Media.Brushes.Black;
        CalendarPopupStart.IsOpen = false;
      }
    }

    private void OpenCalendarEnd(object sender, MouseButtonEventArgs e)
    {
      e.Handled = true;
      CalendarPopupEnd.IsOpen = true;
    }

    private void Calendar_SelectedDateChangedEnd(object sender, SelectionChangedEventArgs e)
    {
      if (CustomCalendarEnd.SelectedDate.HasValue)
      {
        CustomDatePickerComboBoxEnd.Text = CustomCalendarEnd.SelectedDate.Value.ToString("dd.MM.yyyy");
        CustomDatePickerComboBoxEnd.Foreground = System.Windows.Media.Brushes.Black;
        CalendarPopupEnd.IsOpen = false;
      }
    }
  }
}

