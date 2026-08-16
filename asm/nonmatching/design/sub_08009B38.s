	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009B38
sub_08009B38: @ 0x08009B38
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08009B70 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r5, _08009B74 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r2, _08009B78 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08009B7C
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080094EC
	movs r1, #0
	cmp r0, #0
	bne _08009B6A
	movs r1, #1
_08009B6A:
	adds r0, r1, #0
	b _08009B7E
	.align 2, 0
_08009B70: .4byte gUnknown_08499590
_08009B74: .4byte 0x0000417A
_08009B78: .4byte 0x00001432
_08009B7C:
	movs r0, #0
_08009B7E:
	pop {r4, r5}
	pop {r1}
	bx r1

