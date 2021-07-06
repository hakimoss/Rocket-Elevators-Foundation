con = PG::Connection.open(host: '127.0.0.1', port: 5432, user: 'soroush', dbname:'soroushdb', password:'Ms13671370')

random_status = ["Pending", "InProgress", "Interrupted", "Resumed", "Complete"]
random_result = ["Success", "Failure", "Incomplete"]
namespace :api do

  desc "FactIntervention table"
  task factintervention: :environment do
    con.exec('DROP TABLE IF EXISTS FactIntervention')
    con.exec('CREATE TABLE FactIntervention(
      EmployeeID INT,
      BuildingID INT,
      BatteryID INT,
      ColumnID INT,
      ElevatorID INT,
      Start_date TIMESTAMP,
      End_date TIMESTAMP,
      Result VARCHAR,
      Report VARCHAR,
      Status VARCHAR) ;')
  end

  task fiseed: :environment do
    con.exec("TRUNCATE TABLE FactIntervention RESTART IDENTITY;")
    Employee.all.each do |e|
    fakeBuildingId = Faker::Number.number(digits: 2)
    fakeBatteryId = Faker::Number.number(digits: 2)
    fakeColumnId = Faker::Number.number(digits: 2)
    fakeElevatorId = Faker::Number.number(digits: 2)
    fakeStartDate = Faker::Time.between(from: '2021-01-01 00:00:00', to: '2021-03-01 23:59:59')
    fakeEndDate = Faker::Time.between(from: '2021-03-01 00:00:00', to: '2021-07-01 23:59:59')
    status = random_status.sample
    result = random_result.sample
    fakeReport = Faker::Lorem.paragraph
    con.exec("INSERT INTO FactIntervention (EmployeeID, BuildingID, BatteryID, ColumnID, ElevatorID, Start_date, End_date, Status, Result, Report) VALUES (#{e.user_id}, #{fakeBuildingId}, #{fakeBatteryId}, #{fakeColumnId}, #{fakeElevatorId}, '#{fakeStartDate}', '#{fakeEndDate}', '#{status}', '#{result}', '#{fakeReport}');")
    end

  end

  # task fiseed: :environment do
  #   con.exec("TRUNCATE TABLE FactIntervention RESTART IDENTITY;")
  #   Building.all.each do |bld|
  #     buildingID = bld.building_detail.building_id
  #     fakeStartDate = Faker::Time.between(from: '2021-01-01 00:00:00', to: '2021-07-01 23:59:59')
  #     status = random_status.sample
  #     result = random_result.sample
  #     bld.batteries.all.each do |bat|
  #       batteryID = bat.id
  #       bat.employee do |emp|
  #         employeeID = emp.id
  #       end
  #     end
  #     con.exec("INSERT INTO FactIntervention (EmployeeID, BuildingID, BatteryID, Status, Result) VALUES (#{employeeID}, #{buildingID}, '#{batteryID}', '#{status}', '#{result}');")
  #   end

  

end
