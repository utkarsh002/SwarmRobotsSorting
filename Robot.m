classdef Robot < handle
    properties
        value; %according to which sorting will be done
        serial_no; %unique identity no assigned to each robot
        comm_range; %maximum communication radius
        pos; %co-ordinates of robots in space
        feedback_parent; %parent on primary path
        primary_parent; %parent on feedback path
        adjacent; %keeping track of adjacent robots
        radius; %robots radius
        hop_count;
        children;
        status; % 0 = none, 1 = main path, 2 = branch
    end
    
    methods
        function obj = Robot(value, ser_no, comm_range, pos, radius)
            if nargin > 0
                obj.value = value;
                obj.serial_no = ser_no;
                obj.comm_range = comm_range;
                obj.pos = pos;
                obj.feedback_parent = 1e17;
                obj.primary_parent = 1e17;
                obj.adjacent = [];
                obj.radius = radius;
                obj.hop_count = 1e17;
                obj.children = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
                obj.status = 0;
            end
        end
        
        function obj = initialize(obj, value, ser_no, comm_range, pos)
            obj.value = value;
            obj.serial_no = ser_no;
            obj.comm_range = comm_range;
            obj.pos = pos;
            obj.feedback_parent = [];
            obj.primary_parent = [];
            obj.adjacent = [];
        end
    end
end