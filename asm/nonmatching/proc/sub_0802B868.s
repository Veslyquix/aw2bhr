	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B868
sub_0802B868: @ 0x0802B868
	push {r4, lr}
	ldr r3, _0802B89C @ =gUnknown_030033E4
	ldrh r0, [r3]
	lsls r0, r0, #4
	ldr r1, _0802B8A0 @ =gUnknown_08499590
	ldr r2, [r1]
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r3, #2]
	lsls r0, r0, #4
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _0802B8A4
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _0802B8AC
	bl sub_0802B7E8
	b _0802B8BC
	.align 2, 0
_0802B89C: .4byte gUnknown_030033E4
_0802B8A0: .4byte gUnknown_08499590
_0802B8A4:
	ldr r0, _0802B8B4 @ =gUnknown_03003130
	ldrb r0, [r0, #8]
	cmp r0, #1
	bne _0802B8B8
_0802B8AC:
	bl sub_0802B768
	b _0802B8BC
	.align 2, 0
_0802B8B4: .4byte gUnknown_03003130
_0802B8B8:
	bl sub_0802B7E8
_0802B8BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

