require("rspec")
require("pg")
require("patient")

DB = PG.connect({:dbname => 'doctor_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
  end
end

describe("#patient_name") do
  it("lets you read the patient_name out") do
    test_patient = Patient.new({:patient_name => "Jones", :doctor_id => 1, :id =>nil})
    expect(test_patient.patient_name()).to(eq("Jones"))
  end
end

describe("#doctor_id") do
  it("lets you read the doctor ID out") do
    test_patient = Patient.new({:patient_name => "Jones", :doctor_id => 1, :id =>nil})
    expect(test_patient.doctor_id()).to(eq(1))
  end
end

describe("#id") do
  it("lets you read the patient ID out") do
    test_patient = Patient.new({:patient_name => "Jones", :doctor_id => 1, :id => nil})
    expect(test_patient.id()).to(eq(nil))
  end
end

  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end
#
#   describe("#save") do
#     it("adds a patient to the array of saved patients") do
#       test_patient = patient.new({:patient_name => "Jones", :doctor_id => 1})
#       test_patient.save()
#       expect(patient.all()).to(eq([test_patient]))
#     end
#   end
#
#
#
#   describe("#==") do
#     it("is the same patient if it has the same patient_name and doctor ID") do
#       patient1 = patient.new({:patient_name => "Jones", :doctor_id => 1})
#       patient2 = patient.new({:patient_name => "Jones", :doctor_id => 1})
#       expect(patient1).to(eq(patient2))
#     end
#   end
# end
