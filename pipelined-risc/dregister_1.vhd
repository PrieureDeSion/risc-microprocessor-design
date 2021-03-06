library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all; 


entity dregister_1 is                 -- no. of bits
  port (
    din  : in  std_logic;
    dout : out std_logic;
    enable: in std_logic;
    rst : in std_logic;
    clk     : in  std_logic);
end dregister_1;

architecture behave1 of dregister_1 is

begin  -- behave
process(clk)
begin 
  if (rst = '1') then
    dout <= '0';
  elsif(clk'event and clk = '1') then
    if enable = '1' then
      dout <= din;
    end if;
  end if;
end process;
end behave1;
