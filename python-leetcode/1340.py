import collections
import functools
import math
from typing import List


class Solution:
    def numPoints(self, points: List[List[int]], r: int) -> int:
        max_pts = 500
        dis = [[0 for _ in range(max_pts)] for _ in range(max_pts)]

        def getPointsInside(i, r, n):
            # This vector stores alpha and beta and flag
            # is marked true for alpha and false for beta
            angles = []

            for j in range(n):
                if i != j and dis[i][j] <= 2 * r:
                    # acos returns the arc cosine of the complex
                    # used for cosine inverse
                    B = math.acos(dis[i][j] / (2 * r))

                    # arg returns the phase angle of the complex
                    x1, y1 = points[i]
                    x2, y2 = points[j]
                    A = math.atan2(y1 - y2, x1 - x2)
                    alpha = A - B
                    beta = A + B
                    print(i, j, A, B, alpha, beta)
                    angles.append((alpha, False))
                    angles.append((beta, True))

            # angles vector is sorted and traversed
            angles.sort()
            print(angles)
            # count maintains the number of points inside
            # the circle at certain value of theta
            # res maintains the maximum of all count
            cnt, res = 1, 1
            for angle in angles:
                # entry angle
                if angle[1] == 0:
                    cnt += 1
                # exit angle
                else:
                    cnt -= 1

                res = max(cnt, res)

            return res

        # Returns count of maximum points that can lie
        # in a circle of radius r.
        # dis array stores the distance between every
        # pair of points
        n = len(points)
        for i in range(n - 1):
            for j in range(i + 1, n):
                # abs gives the magnitude of the complex
                # number and hence the distance between
                # i and j
                x1, y1 = points[i]
                x2, y2 = points[j]
                dis[i][j] = dis[j][i] = math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
        # print(dis)
        # This loop picks a point p
        ans = 0
        # maximum number of points for point arr[i]
        for i in range(n):
            ans = max(ans, getPointsInside(i, r, n))

        return ans


points = [[-2, 0], [2, 0], [0, 2], [0, -2]]
r = 2
assert 4 == Solution().numPoints(points, r)
