class RutValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # Adapted from http://www.dcc.uchile.cl/~mortega/microcodigos/validarrut/ruby.html
    rut = value.gsub(/\./, '').split('-').first.to_i
    verify_vd = value.gsub(/\./, '').split('-')[1]
    
    v = 1
    s = 0
    for i in (2..9)
      if i == 8
        v = 2
      else 
        v += 1
      end
      s += v * (rut % 10)
      rut /= 10
    end
    
    s = 11 - s % 11
    vd = if s == 11
      0
    elsif s == 10
      "k"
    else
      s
    end
    
    record.errors[attribute] << "incorrecto" unless vd.to_s == verify_vd
  end
end