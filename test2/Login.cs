using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test2
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }


        private void btnPotvrdi_Click(object sender, EventArgs e)
        {
            zaposlenikTableAdapter.FillByKorisnickoIme(gameShopSet.Zaposlenik, txtKorisnickoIme.Text, txtLozinka.Text);
            if(hISDataSet.Zaposlenik.Count>0)
            {
                this.Hide();
                var pocetna = new Pocetna();
                pocetna.Korisnik = hISDataSet.Zaposlenik[0].ime + " " + hISDataSet.Zaposlenik[0].prezime;
                pocetna.Admin = hISDataSet.Zaposlenik[0].Admin;
                pocetna.Show();
            }
            else
            {
                MessageBox.Show("Neispravni korisnički podaci");
            }
        }

        private void Login_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'hISDataSet.Zaposlenik' table. You can move, or remove it, as needed.
            this.zaposlenikTableAdapter.Fill(this.hISDataSet.Zaposlenik);

        }
    }
}
