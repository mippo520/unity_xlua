using Assets.Common.Log;
using Assets.Common.Singleton;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.AStar
{
    public class AStar : Singleton<AStar>
    {
        private List<List<AStarGrid>> m_Map;
        private Int32 m_CountPerLine;
        private Int32 m_LineCount;
        private List<AStarGrid> m_OpenList = new List<AStarGrid>();
        private Dictionary<AStarPos, Int32> m_mapClose = new Dictionary<AStarPos, int>();
        private AStarPos m_EndPos;

        public void createMap(List<List<AStarGrid>> map)
        {
            if (map.Count > 0 && map[0].Count > 0)
            {
                m_Map = map;
                m_CountPerLine = map[0].Count;
                m_LineCount = map.Count;
            }
            else
            {
                Info.Error("AStart init map error!");
            }
        }

        public List<AStarPos> search(AStarPos begin, AStarPos end)
        {
            var path = new List<AStarPos>();
            foreach (var list in m_Map)
            {
                foreach (var grid in list)
                {
                    grid.h = 0;
                    grid.f = 0;
                    grid.g = 0;
                    grid.prePos = null;
                }
            }
            m_EndPos = end;
            m_OpenList.Clear();
            m_mapClose.Clear();
            if (_search(begin))
            {
                var pos = m_EndPos;
                while (pos != begin)
                {
                    path.Insert(0, pos);
                    pos = m_Map[pos.y][pos.x].prePos;
                }
                path.Insert(0, begin);
            }
            else
            {
                Info.Warn(string.Format("Can not found a path form {0},{1} to {2},{3}!", begin.x, begin.y, end.x, end.y));
            }

            return path;
        }

        private bool _search(AStarPos pos)
        {
            if (pos == m_EndPos)
            {
                return true;
            }

            m_mapClose[pos] = 1;

            if (!isLeft(pos))
            {
                var leftPos = new AStarPos(pos.x - 1, pos.y);
                if (!m_mapClose.ContainsKey(leftPos))
                {
                    insertToOpen(leftPos, pos);
                }
            }

            if (!isRight(pos))
            {
                var rightPos = new AStarPos(pos.x + 1, pos.y);
                if (!m_mapClose.ContainsKey(rightPos))
                {
                    insertToOpen(rightPos, pos);
                }
            }

            if (!isTop(pos))
            {
                var topPos = new AStarPos(pos.x, pos.y - 1);
                if (!m_mapClose.ContainsKey(topPos))
                {
                    insertToOpen(topPos, pos);
                }
            }

            if (!isBottom(pos))
            {
                var bottomPos = new AStarPos(pos.x, pos.y + 1);
                if (!m_mapClose.ContainsKey(bottomPos))
                {
                    insertToOpen(bottomPos, pos);
                }
            }

            if (0 == m_OpenList.Count)
            {
                return false;
            }
            else
            {
                var nextPos = m_OpenList[0];
                m_OpenList.RemoveAt(0);
                return _search(nextPos.pos);
            }

        }

        private void insertToOpen(AStarPos pos, AStarPos prePos)
        {
            var grid = m_Map[pos.y][pos.x];
            if (grid.cost < 0)
            {
                return;
            }
            var preGrid = m_Map[prePos.y][prePos.x];
            var newH = grid.cost + preGrid.h;
            if (null == grid.prePos || newH < grid.h)
            {
                if (null != grid.prePos)
                {
                    for (Int32 i = 0; i < m_OpenList.Count; ++i)
                    {
                        if (pos == m_OpenList[i].pos)
                        {
                            m_OpenList.RemoveAt(i);
                            break;
                        }
                    }
                }

                grid.f = fFunc(pos);
                grid.h = newH;
                grid.g = grid.h + grid.f;
                grid.prePos = prePos;

                bool bInsert = false;
                for (Int32 i = 0; i < m_OpenList.Count; ++i)
                {
                    if (grid.g < m_OpenList[i].g)
                    {
                        m_OpenList.Insert(i, grid);
                        bInsert = true;
                        break;
                    }
                }
                if (!bInsert)
                {
                    m_OpenList.Add(grid);
                }
            }
        }

        private Int32 fFunc(AStarPos pos)
        {
            return Math.Abs(m_EndPos.x - pos.x) + Math.Abs(m_EndPos.y - pos.y);
        }

        private bool isLeft(AStarPos pos)
        {
            return 0 == pos.x;
        }

        private bool isRight(AStarPos pos)
        {
            return m_CountPerLine - 1 == pos.x;
        }

        private bool isTop(AStarPos pos)
        {
            return 0 == pos.y;
        }

        private bool isBottom(AStarPos pos)
        {
            return m_LineCount - 1 == pos.y;
        }
    }
}
