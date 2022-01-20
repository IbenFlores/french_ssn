require "date"
require "yaml"
SSN_PATTERN = /^(?<genero>[12])\s?(?<year>\d{2})\s?(?<mes>0[1-9]|1[0-2])\s?(?<region>\d{2})\s?(\d{3}\s?){2}(?<llave>\d{2})$/
MESES = Date::MONTHNAMES

def valid_key?(ssn)
  return (97 - ssn.delete(" ")[0..12].to_i) % 97 == SSN_PATTERN.match(ssn)[:llave].to_i
end

def french_ssn_info(ssn)
  if ssn != "" && valid_key?(ssn)
    match_data = SSN_PATTERN.match(ssn)
    genero = match_data[:genero] == "1" ? "man" : "woman"
    mes = MESES[match_data[:mes].to_i]
    year = match_data[:year]
    region = YAML.load_file("data/french_departments.yml")[match_data[:region]]
    return "a #{genero}, born in #{mes}, 19#{year} in #{region}."
  else
    return "el numero es invalido"
  end
end

p french_ssn_info("1 84 12 76 451 089 46")
 # "a man, born in December, 1984 in Seine-Maritime."
p french_ssn_info("2 76 07 74 865 895 37")
