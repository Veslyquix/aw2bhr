	.include "macro.inc"
	.syntax unified
    

	thumb_func_start Decompress
Decompress: @ 0x08011CAC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #0x18
	adds r1, r4, r0
	ldr r0, _08011CF4 @ =0x00017FFF
	movs r2, #1
	cmp r1, r0
	bhi _08011CC2
	movs r2, #0
_08011CC2:
	ldrb r5, [r3]
	movs r0, #0xf0
	ands r0, r5
	lsrs r0, r0, #3
	adds r0, r2, r0
	ldr r1, _08011CF8 @ =gUnknown_08489314
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	bne _08011D00
	movs r2, #0xf
	ands r2, r5
	ldr r0, [r3]
	ldr r1, _08011CFC @ =0xFFFFFF00
	ands r0, r1
	lsrs r0, r0, #4
	orrs r2, r0
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r3, #0
	adds r1, r4, #0
	bl CpuFastSet
	b _08011D08
	.align 2, 0
_08011CF4: .4byte 0x00017FFF
_08011CF8: .4byte gUnknown_08489314
_08011CFC: .4byte 0xFFFFFF00
_08011D00:
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
_08011D08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

