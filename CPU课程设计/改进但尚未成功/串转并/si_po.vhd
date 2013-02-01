LIBRARY IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY	si_po	IS--serial in,parral out
	port(data_in,clk,enable: in std_logic;
		addr_in: in std_logic_vector(7 downto 0);
		clk16: out  std_logic ;
		data_out: out std_logic_vector(15 downto 0);
		addr_out: out std_logic_vector(7 downto 0));
end	si_po;
architecture behave of si_po is

signal temp_data : std_logic_vector(15 downto 0);
signal temp_addr : std_logic_vector( 7 downto 0);
signal temp_e	  : std_logic;
begin
process(clk,enable)
variable temp_num : integer range 17 downto 0;
begin
if (enable'last_value='0')then
	if clk'event and clk='1'and (clk'last_value='0')and (enable='1')then
	case temp_num is
	when 0 => temp_data(0)<=data_in;temp_num:=1;
	when 1 => temp_data(0)<=data_in;if temp_e='1'then data_out(15)<=temp_data(15);addr_out<=temp_addr;end if;
	when 2 => temp_data(1)<=data_in;if temp_e='1'then clk16<='1';end if;
	when 3 => temp_data(2)<=data_in;if temp_e='1'then clk16<='0';else temp_e<='1';end if;
	when 4 => temp_data(3)<=data_in;
	when 5 => temp_data(4)<=data_in;
	when 6 => temp_data(5)<=data_in;
	when 7 => temp_data(6)<=data_in;
	when 8 => temp_data(7)<=data_in;
	when 9 => temp_data(8)<=data_in;
	when 10 => temp_data(9)<=data_in;
	when 11 => temp_data(10)<=data_in;
	when 12 => temp_data(11)<=data_in;
	when 13 => temp_data(12)<=data_in;
	when 14 => temp_data(13)<=data_in;
	when 15 => temp_data(14)<=data_in;
	when 16 => temp_data(15)<=data_in;data_out<=temp_data;temp_num:=0;temp_addr<=addr_in;
	when 17 => temp_num:=0;data_out<=temp_data;
	when others =>null;
	end case;
	temp_num:=temp_num+1;
	end if;
else if (enable'last_value='1') then temp_e<='0';
		data_out<="ZZZZZZZZZZZZZZZZ";
		addr_out<="ZZZZZZZZ";
		temp_num:=0;
		end if;
end if;
end process;
end behave;