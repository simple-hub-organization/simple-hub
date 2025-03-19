import { EntityProperties } from "./entity_type_utils.js";
import { ActionValues, EntityActions, VendorsAndServices } from "./request_action_types.js";

export class RequestActionObject {
    static event = 'setEntityState';

    constructor(
        entityIds,
        property,
        actionType,
        vendors,
        value
    ) {
        this.entityIds = entityIds;
        this.property = property;
        this.actionType = actionType;
        this.vendors = vendors;
        this.value = value ?? new Map();
    }

    // Static method to create an instance from JSON
    static fromJson(json) {
        const ids = JSON.parse(json.entitiesId);

        return new RequestActionObject(
            new Set(ids),
            json.property,
            json.actionType,
            json.vendors ? new Set(json.vendors) : undefined,
            new Map(Object.entries(json.value).map(([key, val]) => [key, val]))
        );
    }

    toInfrastructure() {
        return {
            entitiesId: Array.from(this.entityIds),
            property: this.property,
            vendors: this.vendors ? Array.from(this.vendors).map(v => v) : [],
            actionType: this.actionType,
            value: Object.fromEntries(
                Array.from(this.value.entries()).map(([key, value]) => [key, value])
            ),
        };
    }
} 