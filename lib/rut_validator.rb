class RutValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # Adapted from http://www.dcc.uchile.cl/~mortega/microcodigos/validarrut/ruby.html
    return if value.nil?
    
    rut = value.gsub(/\./, '').split('-').first.to_i
    verify_vd = value.gsub(/\./, '').split('-')[1]
    
    v = 2
    s = 0
    rut = rut.to_s.split('').reverse
    puts rut.inspect
    for n in rut
      s += v * n.to_i
            
      v += 1
      if v == 8
        v = 2
      end
    end
    
    s = 11 - s % 11
    vd = if s == 11
      0
    elsif s == 10
      "k"
    else
      s
    end
    
    record.errors[attribute] << "incorrecto" unless vd.to_s == verify_vd.try(:downcase)
  end
end