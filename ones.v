module ones(clk_in, switch, s0,s1,s2,s3,s4,s5,btn); 

	input clk_in;			
	input switch;			//switch for clock	
	input btn;
	
	//led instantiation____________________
	output wire [0:6] s0;
	output wire [6:0] s1;
	output wire [6:0] s2;
	output wire [6:0] s3;
	output wire [6:0] s4;
	output wire [6:0] s5;
	
	//4-bit binary nums_____________________
	reg[0:6] segments0;
	reg[6:0] segments1;
	reg[6:0] segments2;
	reg[6:0] segments3;
	reg[6:0] segments4;
	reg[6:0] segments5;
	
	//led output____________________________
	assign s0=segments0;
	assign s1=segments1;	
	assign s2=segments2;
	assign s3=segments3;
	assign s4=segments4;
	assign s5=segments5;
		
	//var for cycle count
	reg [25:0] count=0;
	
	//var for decimal couversions
	reg [3:0] cycle_num_hundreth;
	reg [3:0] cycle_num_tenth;
	reg [3:0] cycle_num_minute;
	reg [3:0] cycle_num_min_tenth;
	reg [3:0] cycle_num_hour;
	reg [3:0] cycle_num_hour_tenth;
	
	
	//Clock_________________________________________________________________
	
	always@(posedge clk_in)
	begin
	
		if(switch)
		begin
			count<=count+1;	//counter starts
			
			if(~btn)
				begin
					cycle_num_hour<=0;
					cycle_num_minute<=0;
					cycle_num_min_tenth<=0;
					cycle_num_minute<=0;
					cycle_num_tenth<=0;
					cycle_num_hundreth<=0;
				end
			
			//Hour_tenth Counter
			if(cycle_num_hour==10)
			begin
				cycle_num_hour<=0;
				cycle_num_hour_tenth<=cycle_num_hour_tenth+1;
			end
			
			//Hour Counter
			if(cycle_num_min_tenth==6)
			begin
				cycle_num_min_tenth<=0;
				cycle_num_hour<=cycle_num_hour+1;
			end
			
			//Minute_tenth Counter
			if(cycle_num_minute==10)
			begin
				cycle_num_minute<=0;
				cycle_num_min_tenth<=cycle_num_min_tenth+1;
			end
			
			//Minute Counter
			if(cycle_num_tenth==6)
			begin
				cycle_num_tenth<=0;
				cycle_num_minute<=cycle_num_minute+1;
			end
	
			//changing from 9seconds to a tenth
			if(cycle_num_hundreth==10)
			begin
				cycle_num_hundreth<=0;
				cycle_num_tenth<=cycle_num_tenth+1;
			end
	
			if(count==50_000_000)	//if it reaches 25_000_000 cycles
			begin
				cycle_num_hundreth<=cycle_num_hundreth+1;
				count<=0;
			end
			
		end
			if(~switch)
			begin
				if(~btn)
				begin
					cycle_num_hour<=0;
					cycle_num_minute<=0;
					cycle_num_min_tenth<=0;
					cycle_num_minute<=0;
					cycle_num_tenth<=0;
					cycle_num_hundreth<=0;
				end
			end
			
		
	end
	
	
	
	
	//BINARY TO DECIMAL CONVERSION HUNDREDTHS________________________________
	
	always@(clk_in)
	begin
			
		case(cycle_num_hundreth)
			4'b0000:segments0=7'b100_0000;	//0
		endcase
		
		case(cycle_num_hundreth)
			4'b0001:segments0=7'b111_1001;	//1
		endcase
		
		case(cycle_num_hundreth)
			4'b0010:segments0=7'b010_0100;	//2
		endcase
		
		case(cycle_num_hundreth)
			4'b0011:segments0=7'b011_0000;	//3
		endcase
		
		case(cycle_num_hundreth)
			4'b0100:segments0=7'b001_1001;	//4
		endcase
		
		case(cycle_num_hundreth)
			4'b0101:segments0=7'b001_0010;	//5
		endcase
		
		case(cycle_num_hundreth)
			4'b0110:segments0=7'b000_0010;	//6
		endcase
		
		case(cycle_num_hundreth)
			4'b0111:segments0=7'b101_1000;	//7
		endcase
		
		case(cycle_num_hundreth)
			4'b1000:segments0=7'b000_0000;	//8
		endcase
		
		case(cycle_num_hundreth)
			4'b1001:segments0=7'b001_0000;	//9
		endcase
		
	end
	
	//BINARY TO DECIMAL CONVERSION Tenths________________________________
	
	always@(clk_in)
	begin
		case(cycle_num_tenth)
			4'b0000:segments1=7'b100_0000;	//0
		endcase
		
		case(cycle_num_tenth)
			4'b0001:segments1=7'b111_1001;	//1
		endcase
		
		case(cycle_num_tenth)
			4'b0010:segments1=7'b010_0100;	//2
		endcase
		
		case(cycle_num_tenth)
			4'b0011:segments1=7'b011_0000;	//3
		endcase
		
		case(cycle_num_tenth)
			4'b0100:segments1=7'b001_1001;	//4
		endcase
		
		case(cycle_num_tenth)
			4'b0101:segments1=7'b001_0010;	//5
		endcase
		
		case(cycle_num_tenth)
			4'b0110:segments1=7'b000_0010;	//6
		endcase
		
		case(cycle_num_tenth)
			4'b0111:segments1=7'b101_1000;	//7
		endcase
		
		case(cycle_num_tenth)
			4'b1000:segments1=7'b000_0000;	//8
		endcase
		
		case(cycle_num_tenth)
			4'b1001:segments1=7'b001_0000;	//9
		endcase
		
	end
	
	always@(clk_in)
	begin
		case(cycle_num_minute)
			4'b0000:segments2=7'b100_0000;	//0
		endcase
		
		case(cycle_num_minute)
			4'b0001:segments2=7'b111_1001;	//1
		endcase
		
		case(cycle_num_minute)
			4'b0010:segments2=7'b010_0100;	//2
		endcase
		
		case(cycle_num_minute)
			4'b0011:segments2=7'b011_0000;	//3
		endcase
		
		case(cycle_num_minute)
			4'b0100:segments2=7'b001_1001;	//4
		endcase
		
		case(cycle_num_minute)
			4'b0101:segments2=7'b001_0010;	//5
		endcase
		
		case(cycle_num_minute)
			4'b0110:segments2=7'b000_0010;	//6
		endcase
		
		case(cycle_num_minute)
			4'b0111:segments2=7'b101_1000;	//7
		endcase
		
		case(cycle_num_minute)
			4'b1000:segments2=7'b000_0000;	//8
		endcase
		
		case(cycle_num_minute)
			4'b1001:segments2=7'b001_0000;	//9
		endcase
	end
	
	always@(clk_in)
	begin
		case(cycle_num_min_tenth)
			4'b0000:segments3=7'b100_0000;	//0
		endcase
		
		case(cycle_num_min_tenth)
			4'b0001:segments3=7'b111_1001;	//1
		endcase
		
		case(cycle_num_min_tenth)
			4'b0010:segments3=7'b010_0100;	//2
		endcase
		
		case(cycle_num_min_tenth)
			4'b0011:segments3=7'b011_0000;	//3
		endcase
		
		case(cycle_num_min_tenth)
			4'b0100:segments3=7'b001_1001;	//4
		endcase
		
		case(cycle_num_min_tenth)
			4'b0101:segments3=7'b001_0010;	//5
		endcase
		
		case(cycle_num_min_tenth)
			4'b0110:segments3=7'b000_0010;	//6
		endcase
		
		case(cycle_num_min_tenth)
			4'b0111:segments3=7'b101_1000;	//7
		endcase
		
		case(cycle_num_min_tenth)
			4'b1000:segments3=7'b000_0000;	//8
		endcase
		
		case(cycle_num_min_tenth)
			4'b1001:segments3=7'b001_0000;	//9
		endcase
	end
	
	always@(clk_in)
	begin
		case(cycle_num_hour)
			4'b0000:segments4=7'b100_0000;	//0
		endcase
		
		case(cycle_num_hour)
			4'b0001:segments4=7'b111_1001;	//1
		endcase
		
		case(cycle_num_hour)
			4'b0010:segments4=7'b010_0100;	//2
		endcase
		
		case(cycle_num_hour)
			4'b0011:segments4=7'b011_0000;	//3
		endcase
		
		case(cycle_num_hour)
			4'b0100:segments4=7'b001_1001;	//4
		endcase
		
		case(cycle_num_hour)
			4'b0101:segments4=7'b001_0010;	//5
		endcase
		
		case(cycle_num_hour)
			4'b0110:segments4=7'b000_0010;	//6
		endcase
		
		case(cycle_num_hour)
			4'b0111:segments4=7'b101_1000;	//7
		endcase
		
		case(cycle_num_hour)
			4'b1000:segments4=7'b000_0000;	//8
		endcase
		
		case(cycle_num_hour)
			4'b1001:segments4=7'b001_0000;	//9
		endcase
	end
	
	always@(clk_in)
	begin
		case(cycle_num_hour_tenth)
			4'b0000:segments5=7'b100_0000;	//0
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0001:segments5=7'b111_1001;	//1
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0010:segments5=7'b010_0100;	//2
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0011:segments5=7'b011_0000;	//3
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0100:segments5=7'b001_1001;	//4
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0101:segments5=7'b001_0010;	//5
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0110:segments5=7'b000_0010;	//6
		endcase
		
		case(cycle_num_hour_tenth)
			4'b0111:segments5=7'b101_1000;	//7
		endcase
		
		case(cycle_num_hour_tenth)
			4'b1000:segments5=7'b000_0000;	//8
		endcase
		
		case(cycle_num_hour_tenth)
			4'b1001:segments5=7'b001_0000;	//9
		endcase
	end
	
	
	
	
	
endmodule