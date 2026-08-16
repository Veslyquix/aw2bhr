	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009720
sub_08009720: @ 0x08009720
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldr r0, _08009750 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r6, _08009754 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08009758 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #7
	beq _08009764
	cmp r0, #7
	bgt _0800975C
	cmp r0, #2
	beq _08009768
	b _08009772
	.align 2, 0
_08009750: .4byte gUnknown_08499590
_08009754: .4byte 0x0000417A
_08009758: .4byte 0x00001432
_0800975C:
	cmp r0, #0xd
	beq _08009764
	cmp r0, #0x13
	bne _08009772
_08009764:
	movs r3, #1
	b _08009772
_08009768:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	adds r3, r0, #0
_08009772:
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

