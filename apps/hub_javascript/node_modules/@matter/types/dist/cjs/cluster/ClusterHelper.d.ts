import { AttributeId } from "../datatype/AttributeId.js";
import { ClusterId } from "../datatype/ClusterId.js";
import { CommandId } from "../datatype/CommandId.js";
import { EventId } from "../datatype/EventId.js";
import { TlvAttributePath, TlvCommandPath, TlvEventPath } from "../protocol/index.js";
import { TypeFromSchema } from "../tlv/TlvSchema.js";
import { Attribute, Cluster, Command, Event } from "./Cluster.js";
interface CachedAttributeInfo {
    attribute: Attribute<any, any>;
    name: string;
}
interface CachedEventInfo {
    event: Event<any, any>;
    name: string;
}
interface CachedCommandInfo {
    command: Command<any, any, any>;
    name: string;
}
export declare const UnknownCluster: (clusterId: ClusterId) => Cluster<import("../index.js").BitSchema, import("../index.js").TypeFromPartialBitSchema<import("../index.js").BitSchema>, import("#general").Merge<{}, import("./Cluster.js").GlobalAttributes<import("../index.js").BitSchema>>, {}, {}>;
export declare function getClusterNameById(clusterId: ClusterId): string;
export declare function getClusterById(clusterId: ClusterId): Cluster<any, any, any, any, any>;
export declare function getClusterAttributeById(clusterDef: Cluster<any, any, any, any, any>, attributeId: AttributeId): CachedAttributeInfo | undefined;
export declare function getClusterEventById(clusterDef: Cluster<any, any, any, any, any>, eventId: EventId): CachedEventInfo | undefined;
export declare function getClusterCommandById(clusterDef: Cluster<any, any, any, any, any>, commandId: CommandId): CachedCommandInfo | undefined;
export declare function resolveAttributeName({ nodeId, endpointId, clusterId, attributeId, }: TypeFromSchema<typeof TlvAttributePath>): string;
export declare function resolveEventName({ nodeId, endpointId, clusterId, eventId, isUrgent, }: TypeFromSchema<typeof TlvEventPath>): string;
export declare function resolveCommandName({ endpointId, clusterId, commandId }: TypeFromSchema<typeof TlvCommandPath>): string;
export {};
//# sourceMappingURL=ClusterHelper.d.ts.map