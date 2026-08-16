	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008C34
sub_08008C34: @ 0x08008C34
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08008C68 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r5, _08008C6C @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r2, _08008C70 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _08008C74
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_08008C7C
	cmp r0, #0
	beq _08008C74
	movs r0, #1
	b _08008C76
	.align 2, 0
_08008C68: .4byte gUnknown_08499590
_08008C6C: .4byte 0x0000417A
_08008C70: .4byte 0x00001432
_08008C74:
	movs r0, #0
_08008C76:
	pop {r4, r5}
	pop {r1}
	bx r1

