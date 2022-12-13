# Team-15-Project-V1


## Important Notes:
- Per Prof H and Anjali's instructions, we did not spend any time on testing and rather focused on our features. 
- For the charts in each `updatedetailview`, you need to select `derivative` or `nonderivative` to view the charts 

Sample login:
- Username: Ed882016@163.com
- Password: 123456abc

## Usage Explanation:
### Search
- You can search for updates or companies by typing in company name/ticker, such as `Apple` or `AAPL`
- With the daily limits of reads from `Firebase` and API limits explained below, we only added limited data points 

### Company Search
- `Apple`/`AAPL`
- `Tesla`/`TSLA
- `Microsoft`/`MSFT`

### Executive Search 
- `Timothy Whealey`

## API Documentation:
### SEC-API
- API-Key: `ec5d36984349cb27b4707959304eb10a769d0026c9b56dde1c25fa3a76dbb02d`
- Limitations: 100 calls in total per account
- Get Insider transactions/executives information 

### Finnhub-API
- API-Key: `ce74i7aad3iakcsvp5agce74i7aad3iakcsvp5b0`
- Limitations: 30 calls/second & 100 calls/minute 
- Get company details, recommendations, social sentiments 
- Background Fetch With Python: `https://github.com/EdwardChen777/Team15_API_Fetch`

### Yahoo-Finance
- API-Key: `5193c1c87fmsh2d8a946b1721cbfp1e0eefjsn2e6fde45177d`
- Limitations: 
- Get news list from Yahoo Finance

### Seeking Alpha
- API-Key: `5193c1c87fmsh2d8a946b1721cbfp1e0eefjsn2e6fde45177d`
- Limitations: 
- Get news list from Seeking Alpha
