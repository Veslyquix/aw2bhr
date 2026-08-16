	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801930C
sub_0801930C: @ 0x0801930C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	ldr r6, _08019344 @ =gUnknown_0200C528
_08019314:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, r5
	bne _0801932C
	adds r0, r4, #0
	bl sub_080192EC
_0801932C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08019314
	movs r0, #1
	rsbs r0, r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08019344: .4byte gUnknown_0200C528

