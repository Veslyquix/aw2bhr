	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008C7C
sub_08008C7C: @ 0x08008C7C
	push {r4, lr}
	ldr r2, _08008CA4 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _08008CA8 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08008CAC @ =0x00000A22
	adds r3, r3, r0
	adds r3, r3, r1
	ldrh r0, [r3]
	cmp r0, #0x13
	beq _08008CA0
	cmp r0, #0x16
	bne _08008CB0
_08008CA0:
	movs r0, #0
	b _08008CB2
	.align 2, 0
_08008CA4: .4byte gUnknown_08499590
_08008CA8: .4byte 0x0000417A
_08008CAC: .4byte 0x00000A22
_08008CB0:
	movs r0, #1
_08008CB2:
	pop {r4}
	pop {r1}
	bx r1

