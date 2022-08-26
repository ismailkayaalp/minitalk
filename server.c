/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikayaalp <ikayaalp@student.42kocaeli.      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/24 10:44:34 by ikayaalp          #+#    #+#             */
/*   Updated: 2022/06/24 10:44:36 by ikayaalp         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	sig_usr(int sig)
{
	static char	str = 0;
	static int	get_byte = 0;

	if (sig == SIGUSR1)
		str = str | 1;
	if (++get_byte == 8)
	{
		get_byte = 0;
		if (!str)
			ft_putchar('\n');
		ft_putchar(str);
		str = 0;
	}
	else
		str <<= 1;
}

int	main(void)
{
	ft_printstr("işlem kimliği --> ");
	ft_putnbr(getpid());
	ft_putchar('\n');
	signal(SIGUSR1, sig_usr);
	signal(SIGUSR2, sig_usr);
	while (1)
	{
		pause();
	}
	return (0);
}
