	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080620C0
sub_080620C0: @ 0x080620C0
	push {r4, r5, r6, r7, lr}
	movs r0, #0
	ldr r1, _080620F4 @ =gUnknown_02029ED8
	mov ip, r1
	ldr r7, _080620F8 @ =gUnknown_030033EC
	movs r6, #0
_080620CC:
	movs r3, #0
	adds r5, r0, #1
	lsls r4, r0, #5
_080620D2:
	adds r2, r3, r4
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r2, r2, r0
	add r2, ip
	strb r6, [r2]
	adds r3, #1
	cmp r3, #0x1f
	ble _080620D2
	adds r0, r5, #0
	cmp r0, #2
	ble _080620CC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080620F4: .4byte gUnknown_02029ED8
_080620F8: .4byte gUnknown_030033EC

