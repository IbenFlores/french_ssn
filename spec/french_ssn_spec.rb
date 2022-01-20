require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "devuelve 'el numero es invalido' cuando se le pasa un string vacio" do
    actual = french_ssn_info("")
    expected = "el numero es invalido"
    expect(actual).to eq(expected)
  end
  it "devuelve 'a man, born in December, 1984 in Seine-Maritime.' cuando se le pasa '1 84 12 76 451 089 46'" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end
