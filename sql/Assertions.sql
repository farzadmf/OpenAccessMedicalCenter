
#/*Assertion to keep make Play Areas locations only appear in Unit 2*/
CREATE ASSERTION Play_Area_in_Unit_2_Only
CHECK ( NOT EXISTS (SELECT * FROM Location WHERE Location.Usage = 'Play Area' AND (Location.Unit_ID = 1 OR Location.Unit_ID = 3);

/*Constraint to keep make Play Areas locations only appear in Unit 2*/

ALTER TABLE Location
ADD CONSTRAINT Play_Area_in_Unit_2_Only
CHECK ( if Location.Usage = 'Play Area' then Location.Unit_ID <> 1 or Location.Unit_ID <> 3);


