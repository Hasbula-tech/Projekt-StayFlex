using System;
using System.Windows;
using System.Windows.Controls;

namespace StayFlex.View
{
  public partial class Zimmerauswahl : UserControl
  {


    public Zimmerauswahl()
    {
      InitializeComponent();
    }



    private void ListBoxItem_Selected(object sender, System.Windows.RoutedEventArgs e)
    {


    }

    private void CloseZimmerAuswahl(object sender, RoutedEventArgs e)
    {
      // Findet das Hauptfenster und ruft die Schließen-Methode auf
      if (Window.GetWindow(this) is MainWindow mainWindow)
      {
        mainWindow.CloseZimmerAuswahl(sender, e);
      }
    }
  }
}
