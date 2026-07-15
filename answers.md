# Carebot L2 Support Engineer Assignment

## Task 1: Incident Triage

1. Hospital A: Critical
   - Reasoning: Production environment is not working and direct patient care is affected. This combines high impact and urgency.

2. Internal Team: Medium
   - Reasoning: Product value is not impacted, issue is however slowing down productivity of internal team, resulting in lower impact.

3. Hospital B: Medium
   - Reasoning: This indicates in-production bug effecting patient care with very limited impact, but significant urgency.
     1
4. Hospital C: High
   - Reasoning: The production gateway is unavailable, which is a significant issue, urgency is however low due to remaining time before going live, making this high impact overall.

## Task 2: Communication

### Question 1: Most likely point of failure

The Gateway is healthy: it successfully processed the last received scan and is able to reach the hospital Autorouter API over network.

Metrics however indicate contradicting reports with graphana saying last scan was received at 14:15, yet logs from gateway indicate last one from 14:12. This requires further analysis on our end with second likely culprit being network error between the hospital and our Gateway, with the Autorauter while still alive either not processing scans successfully or not receiving them at all.

### Question 2: What to request from the hospital/internal team

Obvious first step is to find out from where graphana gets last processed scan timestamp and continue from there (issue however seems to be directed to the communication solution and so I will focus on this from now on, leaving metrics inconsistency for the case my other investigation leads to a dead end..).

Problem seems to be outside of our infrastructure, there is therefore a need to request the hospital/internal team to check the autorouter and results delivery path on their side, specifically:

- Whether the hospital autorouting system received and forwarded the processed results after 14:12.
- If there are any local errors or retries in the autorouter logs after 14:12.
- Whether the hospital API or results ingestion endpoint has any rate limiting, validation errors, or downtime.
- Confirmation of the destination system where predictions should appear and whether that system shows any errors.

### Question 3: Email reply to L1 partner

Subject: Re: URGENT: Hospital XYZ - AI results appear to be delayed

Hi Team,

I reviewed your ticket 123 with the reports not comming in. The last scan from Hospital XYZ was received at 14:12 and was processed successfully. However, we do not see any new scans received by the Gateway after that time, despite the hospital reporting that additional were sent over. This suggests the issue is likely occurring before scans reach the Gateway, either within the hospital's autorouting workflow or during transmission to the Gateway.

To continue the investigation, please ask Hospital XYZ to verify:

Whether the autorouter shows the affected scans were successfully sent to the Gateway.
Whether there are any transmission errors or queued studies in the autorouter.
Whether they can provide details of scans sent from 14:10 onword (timestamp and identifier) so we can correlate it with our Gateway logs.

Once we have this information, we can continue troubleshooting from our side.

Thanks,
L2 Support
