﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net
{
    public interface INetInterface
    {
        void Close(bool isPassive = true);
        void SetPackageCreator(IPackageCreator creator);
        void StartReceive();
        void ConsultFinish();
        void ReceiveCallback(byte[] data, int lenth);
    }
}