// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Security.Cryptography.X509Certificates;

namespace Test.Utility.Signing
{
    public class ChainCertificateRequest : IDisposable
    {
        private bool _isDisposed;

        public string CrlServerBaseUri { get; set; }

        public string CrlLocalBaseUri { get; set; }

        public bool IsCA { get; set; }

        public bool ConfigureCrl { get; set; } = true;

        public X509Certificate2 Issuer { get; set; }

        public string IssuerDN => Issuer?.Subject;

        public void Dispose()
        {
            if (!_isDisposed)
            {
                Issuer?.Dispose();

                GC.SuppressFinalize(this);

                _isDisposed = true;
            }
        }
    }
}