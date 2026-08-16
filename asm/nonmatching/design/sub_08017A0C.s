	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017A0C
sub_08017A0C: @ 0x08017A0C
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _08017A44 @ =gUnknown_0849958C
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r4, r0, #0
	ldr r3, _08017A48 @ =0x000001FF
_08017A1A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [r5]
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r4, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _08017A1A
	ldr r0, _08017A4C @ =gUnknown_0300309C
	ldr r2, _08017A50 @ =0x0000FF60
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08017A54 @ =gUnknown_03002028
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017A44: .4byte gUnknown_0849958C
_08017A48: .4byte 0x000001FF
_08017A4C: .4byte gUnknown_0300309C
_08017A50: .4byte 0x0000FF60
_08017A54: .4byte gUnknown_03002028

