using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Tools
{
    class MathFuc
    {
        public static int MaxDivisor(int a, int b)
        {
            if (a < b) { a = a + b; b = a - b; a = a - b; }
            return (a % b == 0) ? b : MaxDivisor(a % b, b);
        }

        public static int MinMultiple(int a, int b)
        {
            return a * b / MaxDivisor(a, b);
        }
    }
}
