	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039140
sub_08039140: @ 0x08039140
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _0803917C @ =gUnknown_08499590
	ldr r2, [r0]
	movs r6, #6
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08039180
	cmp r1, #0x9f
	bgt _08039180
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble _08039180
	cmp r0, #0xef
	bgt _08039180
	movs r0, #1
	b _08039182
	.align 2, 0
_0803917C: .4byte gUnknown_08499590
_08039180:
	movs r0, #0
_08039182:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

