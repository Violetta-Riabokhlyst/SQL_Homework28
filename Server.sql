class Program
{
    static void Main()
    {
        UdpClient server = new UdpClient(5555);

        Console.WriteLine("Computer parts price server started.");

        IPEndPoint clientEndPoint = null;

        while (true)
        {
            byte[] data = server.Receive(ref clientEndPoint);

            string request = Encoding.UTF8.GetString(data);

            if (request == "exit")
            {
                continue;
            }

            string price;

            if (request == "processor")
            {
                price = "Processor price: 250 EUR";
            }
            else if (request == "video card")
            {
                price = "Video card price: 500 EUR";
            }
            else if (request == "motherboard")
            {
                price = "Motherboard price: 180 EUR";
            }
            else if (request == "RAM")
            {
                price = "RAM price: 80 EUR";
            }
            else if (request == "SSD")
            {
                price = "SSD price: 100 EUR";
            }
            else if (request == "power supply")
            {
                price = "Power supply price: 90 EUR";
            }
            else
            {
                price = "Part not found.";
            }

            byte[] response = Encoding.UTF8.GetBytes(price);

            server.Send(
                response,
                response.Length,
                clientEndPoint);
        }
    }
}