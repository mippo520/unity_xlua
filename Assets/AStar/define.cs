using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.AStar
{
    public class AStarPos
    {
        public AStarPos(Int32 x, Int32 y)
        {
            this.x = x;
            this.y = y;
        }

        public Int32 x { get; set; }
        public Int32 y { get; set; }

        public static bool operator ==(AStarPos lp, AStarPos rp)
        {
            if (object.Equals(null, lp) || object.Equals(null, rp))
            {
                return object.Equals(lp, rp);
            }
            return lp.x == rp.x && lp.y == rp.y;
        }

        public static bool operator !=(AStarPos lp, AStarPos rp)
        {
            if (object.Equals(null, lp) || object.Equals(null, rp))
            {
                return !object.Equals(lp, rp);
            }
            return lp.x != rp.x || lp.y != rp.y;
        }
    }

    public class AStarGrid
    {
        public AStarPos pos { get; set; }
        public AStarPos prePos { get; set; }
        public Int32 g { get; set; }
        public Int32 h { get; set; }
        public Int32 f { get; set; }
        public Int32 cost { get; set; }

        public AStarGrid()
        {
            cost = 1;
        }
    }

}
