#' @docType package
#' @name spsur-package
#' @rdname spsur-package
#'
#' @title Spatial Seemingly Unrelated Regression Models.
#'
#' @description
#'  \pkg{spsur} offers the user a collection of functions to estimate Spatial 
#'   Seemingly Unrelated Regression (SUR) models by maximum likelihood or 
#'   three-stage least squares, using spatial instrumental variables. 
#'   Moreover, \pkg{spsur} obtains a collection of misspecification
#'   tests for omitted or wrongly specified spatial structure. The user will 
#'   find spatial models more popular in applied research such as the SUR-SLX, 
#'   SUR-SLM, SUR-SEM, SUR-SDM, SUR-SDEM SUR-SARAR and SUR-GNM 
#'   plus the spatially independent SUR, or SUR-SIM.
#'
#' @details
#'  Some functionalities that have been included in \pkg{spsur} package are:
#'
#' @section 1. Testing for spatial effects:
#'   The function \code{\link{lmtestspsur}} provides a collection of 
#'   Lagrange Multipliers, LM, for testing different forms of spatial 
#'   dependence in SUR models. They are extended versions of
#'   the well-known LM tests for omitted lags of the explained variable in 
#'   the right hand side of the equation, LM-SLM, the LM tests for omitted 
#'   spatial errors, LM-SEM, the join test of omitted spatial lags and 
#'   spatial errors, LM-SARAR, and the robust version of the firt
#'   two Lagrange Multipliers, LM*-SLM  and LM*-SEM. \cr
#'   These tests can be applied to models always with a SUR nature. Roughly, 
#'   we may distinguish two situations:
#'   \itemize{
#'    \item Datasets with a single equation \emph{G=1}, for different time 
#'    periods \emph{Tm>1} and a certain number of spatial units in the 
#'    cross-sectional dimension, \emph{N}. This is what we call
#'    \emph{spatial panel datasets}. In this case, the SUR structure appears 
#'    in form of (intra) serial dependence in the errors of each spatial unit.
#'    \item Datasets with a several equations \emph{G>1}, different time 
#'    periods \emph{Tm>1} and a certain number of spatial units, \emph{N}. 
#'    The SUR structure appears, as usual, because the errors
#'    of the spatial units for different equations are contemporaneously 
#'    correlated.
#'   }
#'
#'
#' @section 2. Estimation of the Spatial SUR models:
#'   As indicated above, \pkg{spsur} package may work with a list of 
#'   different spatial specifications.
#'   They are the following:
#'   \itemize{
#'     \item \emph{SUR-SIM}: SUR model without spatial effects
#'            \deqn{ y_{tg} =  X_{tg} \beta_{g} + \epsilon_{tg} }
#'     \item \emph{SUR-SLX}: SUR model with spatial lags of the regresors
#'            \deqn{ y_{tg} = X_{tg} \beta_{g} + 
#'                            WX_{tg} \theta_{g} + \epsilon_{tg} }
#'     \item \emph{SUR-SLM}: SUR model with spatial lags of the endogenous
#'            \deqn{y_{tg} = \rho_{g} Wy_{tg} + X_{tg} \beta_{g} + 
#'                           \epsilon_{tg} }
#'      \item \emph{SUR-SEM}: SUR model with spatial errors
#'             \deqn{ y_{tg} = X_{tg} \beta_{g} + u_{tg} }
#'             \deqn{ u_{tg} = \lambda_{g} Wu_{tg} + \epsilon_{tg} }
#'      \item \emph{SUR-SDM}: SUR model with spatial lags of the endogenous 
#'            variable and of the regressors or Spatial Durbin model
#'            \deqn{ y_{tg} = \rho_{g} Wy_{tg} + X_{tg} \beta_{g} + 
#'                             WX_{tg} \theta_{g} + \epsilon_{tg} }
#'      \item \emph{SUR-SDEM}: SUR model with spatial errors and spatial 
#'            lags of the endogenous variable and of the regressors
#'             \deqn{ y_{tg} = X_{tg} \beta_{g} + WX_{tg} \theta_{g} + u_{tg} }
#'              \deqn{ u_{tg} = \lambda_{g} W u_{tg} + \epsilon_{tg} }
#'      \item \emph{SUR-SARAR}: Spatial lag model with spatial errors
#'             \deqn{ y_{tg} = \rho_{g} Wy_{tg} + X_{tg} \beta_{g} + 
#'                              u_{tg} }
#'              \deqn{ u_{tg} = \lambda_{g} W u_{tg} + \epsilon_{tg} }
#'      \item \emph{SUR-GNM}: SUR model with spatial lags of the explained 
#'        variables, regressors and spatial errors
#'       \deqn{ y_{tg} = \rho_{g} Wy_{tg} + X_{tg} \beta_{g} + 
#'                         WX_{tg} \theta_{g} + u_{tg} }
#'       \deqn{ u_{tg} = \lambda_{g} W u_{tg} + \epsilon_{tg} }
#'    }
#'          where \eqn{y_{tg}}, \eqn{u_{tg}} and \eqn{\epsilon_{tg}} are 
#'          \emph{(Nx1)} vectors; \eqn{X_{tg}} is a matrix of regressors of 
#'          order \emph{(NxP)}; \eqn{\rho_{g}} and \eqn{\lambda_{g}} are 
#'          parameters of spatial dependence and \emph{W} is the
#'          \emph{(NxN)} spatial weighting matrix.
#'
#'         These specifications can be estimated by maximum-likelihood 
#'         methods, using the function \code{\link{spsurml}}. Moroever, 
#'         the models that include spatial lags of the explained
#'         variables in the right hand side of the equations, and the 
#'         errors are assumed to be spatially incorrelated (namely, the 
#'         SUR-SLM and the SUR-SDM), can also be estimated using
#'         three-stage least-squares, \code{\link{spsur3sls}}, 
#'         using spatial instrumental variable to correct for the problem of
#'         endogeneity present in these cases.
#'
#' @section 3. Diagnostic tests:
#'   Testing for inconsistencies or misspecifications in the results of an 
#'   estimated (SUR) model should be a primary task for the user. \pkg{spsur} 
#'   focuses, especifically, on two main question such as omitted
#'   or wrongly specified spatial structure and the existence of structural 
#'   breaks or relevant restrictions
#'   in the parameters of the model. In this sense, the user will find:
#'
#'  \enumerate{
#'    \item \emph{Marginal tests} \cr
#'      The Marginal Multipliers test for omitted or wrongly specified spatial 
#'      structure in the equations. They are routinely part of the output of 
#'      the maximum-likelihood estimation, shown by \code{\link{spsurml}}. 
#'      In particular, the LM(\eqn{\rho}|\eqn{\lambda}) tests for omitted 
#'      spatial lags in a model specified with spatial errors (SUR-SEM; 
#'      SUR-SDEM). The LM(\eqn{\lambda}|\eqn{\rho}) tests for omitted 
#'      spatial error in a model specified with spatial lags
#'      of the explained variable (SUR-SLM; SUR-SDM).
#'
#'    \item \emph{Coefficients stability tests} \cr
#'      \pkg{spsur} includes two functions designed to test for linear 
#'       restrictions on the \eqn{\beta} coefficients of the models and on 
#'       the spatial coefficients (\eqn{\rho}s and \eqn{\lambda}s terms). 
#'       The function for the first case is \code{\link{wald_betas}} and
#'      \code{\link{wald_deltas}} that of the second case. The user has 
#'      ample flexibility to define different forms of linear restrictions, 
#'      so that it is possible, for example,
#'      to test for their time constancy to identify structural breaks.
#'  }
#'
#' @section 4. Marginal effects:
#'   In recent years, since the publication of LeSage and Pace (2009), 
#'   it has become popular in
#'   spatial econometrics to evaluate the multiplier effects that a change in 
#'   the value of a regressor, in a point in the space, has on the explained 
#'   variable. \pkg{spsur} includes a function, \code{\link{impacts}}, 
#'   that computes these effects. Specifically, \code{\link{impacts}} obtains
#'   the average, over the \emph{N} spatial units and \emph{Tm} time periods, 
#'   of such a change on the contemporaneous value of the explained variable 
#'   located in the same point as the modified variable. This is the 
#'   so-called \emph{Average Direct effect}. The \emph{Average Indirect 
#'   effect} measure the proportion of the impact that spills-over to other 
#'   locations. The sum of the two effects is the \emph{Average Total effect}. 
#'   \cr
#'   These estimates are complemented with a measure of statistical 
#'   significance, following the randomization approach suggested by 
#'   LeSage and Pace (2009).
#'
#' @section 5. Additional functionalities:
#'   A particular feature of \pkg{spsur} is that the package allows to 
#'   obtain simulated datasets with a SUR nature and the spatial structure 
#'   decided by the user. This is the purpose of the function 
#'   \code{\link{dgp_spsur}}. The function can be inserted into a more 
#'   general code to solve, for example, Monte Carlo studies related to 
#'   these type of models or, simply, to show some of the stylized 
#'   characteristics of a SUR model with certain spatial structure.
#'
#' @section Datasets:
#'   \pkg{spsur} includes three different datasets: spc, NCOVR and spain.covid. These 
#'   sets are used to 
#'   illustrate the capabilities of different functions. Briefly, their 
#'   main characteristics are the following \cr
#'   \itemize{
#'     \item The \emph{spc} dataset (Spatial Phillips-Curve) is a 
#'      classical dataset taken from Anselin (1988, p. 203), of small 
#'      dimensions.
#'      \item The \emph{NCOVR} dataset comprises Homicides and a list of 
#'      selected socio-economic variables for continental U.S. counties 
#'      in four decennial census years: 1960, 1970, 1980 and 1990. 
#'      It is freely available from
#'        \url{https://geodacenter.github.io/data-and-lab/ncovr/}. 
#'        \emph{NCOVR} is a typical spatial panel dataset \emph{(G=1)}.
#'      \item The \emph{spain.covid} dataset comprises Within and Exit mobility index 
#'      together with the weeklly incidence COVID-19 at Spain provinces from 
#'      February 21 to May 21 2020. 
#'      \url{https://www.mitma.gob.es/ministerio/covid-19/evolucion-movilidad-big-data}
#'    }
#'
#' @references
#'   \itemize{
#'     \item Breusch T, Pagan A (1980). The Lagrange multiplier test
#'       and its applications to model specification in econometrics.
#'       \emph{Review of Economic Studies} 47: 239-254.
#'
#'      \item LeSage, J., and Pace, R. K. (2009). \emph{Introduction to
#'        spatial econometrics}. Chapman and Hall/CRC.
#'
#'      \item Lopez, F.A., Mur, J., and Angulo, A. (2014). Spatial model
#'        selection strategies in a SUR framework. The case of regional
#'        productivity in EU. \emph{Annals of Regional Science},
#'        53(1), 197-220.
#'        <doi:10.1007/s00168-014-0624-2>
#'
#'      \item Lopez, F.A., Martinez-Ortiz, P.J., and Cegarra-Navarro, J.G.
#'        (2017). Spatial spillovers in public expenditure on a municipal
#'        level in Spain. \emph{Annals of Regional Science}, 58(1), 39-65.
#'        <doi:10.1007/s00168-016-0780-7>
#'
#'      \item Mur, J., Lopez, F., and Herrera, M. (2010). Testing for spatial
#'        effects in seemingly unrelated regressions. \emph{Spatial Economic
#'        Analysis}, 5(4), 399-440.
#'        <doi:10.1080/17421772.2010.516443>
#'   }
#'
#' @author
#'   \tabular{ll}{
#'   Fernando Lopez  \tab \email{fernando.lopez@@upct.es} \cr
#'   Roman Minguez  \tab \email{roman.minguez@@uclm.es} \cr
#'   Jesus Mur  \tab \email{jmur@@unizar.es} \cr
#'   }
#'
#' @importFrom Formula Formula model.part
#' @importFrom gmodels estimable
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_pointrange
#' @importFrom ggplot2 labs
#' @importFrom gridExtra grid.arrange
#' @importFrom MASS ginv
#' @importFrom Matrix bdiag crossprod Diagonal Matrix solve t
#' @importFrom methods as
#' @importFrom minqa bobyqa
#' @importFrom numDeriv hessian
#' @importFrom rlang .data
#' @importFrom sparseMVN rmvn.sparse
#' @importFrom spatialreg get.ZeroPolicyOption create_WX trW  
#' @importFrom spatialreg can.be.simmed jacobianSetup do_ldet 
#' @importFrom spatialreg impacts intImpacts lmSLX invIrW  
#' @importFrom spdep knearneigh knn2nb nb2mat
#' @importFrom spdep card mat2listw 
#' @importFrom stats cor cov optim pchisq pnorm pt qnorm rnorm runif
#' @importFrom stats coefficients fitted lm residuals printCoefmat
#' @importFrom stats model.frame model.matrix terms
#' @importFrom stats anova coef formula logLik AIC BIC
#' @importFrom stats na.action napredict update
NULL
