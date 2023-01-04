
""""
The idea of the scrape is to see if i can scrape every team's page,
and in those pages to see if i can scrape the teams calendar, players bio and information.
    

""""

from bs4 import BeautifulSoup
import requests


#first I am assigning teams page to a teams name string

atleticos = "https://www.bsnpr.com/atleticos"

brujos = "https://www.bsnpr.com/brujos"

response = requests.get(atleticos)
type (response)


#I found the common folder so maybe instead of scraping the website per atheltes ID
# maybe i can scrape for the folder since all the players info comes out the same folder.
#with that in mind the images might do to. I want to run a scrape but take  a node screenshot. 
#that way we do not have to pull that query and search and just create a memory bank with less memory

players_bio = "/jugadores/jugador.asp?id= " 

players_image = "/uploads/jugadores_small/"

