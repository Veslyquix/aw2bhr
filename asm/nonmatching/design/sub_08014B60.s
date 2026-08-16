	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014B60
sub_08014B60: @ 0x08014B60
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	ldr r3, [sp, #0x10]
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0xa
	adds r4, r2, r1
_08014B76:
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	ldr r1, _08014BAC @ =0x00000123
	adds r0, r2, r1
	orrs r0, r6
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r3, _08014BB0 @ =0x00000133
	adds r0, r2, r3
	orrs r0, r6
	strh r0, [r1]
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _08014B76
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014BAC: .4byte 0x00000123
_08014BB0: .4byte 0x00000133

