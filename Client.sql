class Program
{
    static void Main()
    {
        UdpClient client = new UdpClient();

        IPEndPoint serverEndPoint =
            new IPEndPoint(
                IPAddress.Parse("127.0.0.1"),
                5555);

        Console.WriteLine("Connected to computer parts price server.");

        while (true)
        {
            Console.WriteLine();
            Console.WriteLine("Enter a computer part:");
            Console.WriteLine("processor");
            Console.WriteLine("video card");
            Console.WriteLine("motherboard");
            Console.WriteLine("RAM");
            Console.WriteLine("SSD");
            Console.WriteLine("power supply");
            Console.WriteLine("Enter exit to disconnect.");

            string request = Console.ReadLine();

            byte[] data = Encoding.UTF8.GetBytes(request);

            client.Send(
                data,
                data.Length,
                serverEndPoint);

            if (request == "exit")
                break;

            IPEndPoint serverResponse = null;

            byte[] response =
                client.Receive(ref serverResponse);

            string price =
                Encoding.UTF8.GetString(response);

            Console.WriteLine("Server: " + price);
        }

        client.Close();

        Console.WriteLine("Disconnected.");
    }
}