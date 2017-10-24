


library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;


entity rf is 
	port( A1,A2,A3 : in std_logic_vector(2 downto 0);
		  D3: in std_logic_vector(15 downto 0);
		  
		clk,wr, pc_wr,pc_read: in std_logic ;
		D1, D2: out std_logic_vector(15 downto 0);
end entity;

architecture rf_behave of rf is 
 
--type registerFile is array(0 to 15) of std_logic_vector(63 downto 0);
signal registers: array(0 to 7) of std_logic_vector(15 downto 0);

begin 

process (clk)
begin 
	if(clk'event and clk = '1') then
		
		D2 <= registers(to_integer(unsigned(A2)));
	    D1 <= registers(to_integer(unsigned(A1)));

		if(pc_read ='1')
			 D1 <= registers(7);
		end if; 

		if (wr = '1') 
		 	 registers(to_integer(unsigned(A3))) <= D3; 
			if (pc_wr = '1') 
			  registers(7) <= D3;  
	   		 end if; 
		end if; 

	end if; 
end process;
end rf_behave;
	    
