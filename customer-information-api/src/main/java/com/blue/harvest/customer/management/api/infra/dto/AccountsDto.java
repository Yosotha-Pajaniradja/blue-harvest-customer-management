package com.blue.harvest.customer.management.api.infra.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Value;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * DTO for {@link com.blue.harvest.customer.management.api.infra.jpa.entity.CustomerAccountEntity}
 */
@Data
@Builder(setterPrefix = "with")
public class AccountsDto implements Serializable {
  private String accountNumberTarget;
  private String customerIdentifier;
  private LocalDate accountCreationDate;
  private LocalDateTime accountValidityDate;
}
