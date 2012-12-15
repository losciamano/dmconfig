function cpu_freq_max(cpu)
	local freq = tonumber(conky_parse(string.format('${head /sys/devices/system/cpu/cpu%d/cpufreq/cpuinfo_max_freq 1}', cpu)));  
	return freq;
end

function cpu_freq_current(cpu)
	local freq = tonumber(conky_parse(string.format('${head /sys/devices/system/cpu/cpu%d/cpufreq/scaling_cur_freq 1}', cpu)));
	return freq;
end 

function conky_cpu_freq_g(cpu)
	local freq = cpu_freq_current(cpu);
	return string.format('%0.2f', freq / 1000000);
end

function conky_cpu_perc(cpu) 
	local cur =  cpu_freq_current(cpu)
	local max = cpu_freq_max(cpu);
	return string.format('%0.2f',(cur/max)*100);
end

function conky_cpufreq_driver()
	local driver = conky_trim(conky_parse('${head /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver 1}'));
	return driver
end

function conky_cpufreq_governor()
	local driver = conky_trim(conky_parse('${head /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 1}'));
	return driver
end

function conky_trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
