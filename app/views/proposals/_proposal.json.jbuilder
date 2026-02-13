json.extract! proposal, :id, :job_id, :freelancer_id, :cover_letter, :bid_amount, :estimated_time, :status, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
