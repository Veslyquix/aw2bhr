	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010604
sub_08010604: @ 0x08010604
	push {r4, lr}
	ldr r2, _08010634 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _08010638 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801063C @ =0x00000A22
	adds r3, r3, r0
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r0, #0xa1
	lsls r0, r0, #1
	cmp r1, r0
	beq _0801062E
	adds r0, #0x20
	cmp r1, r0
	bne _08010640
_0801062E:
	movs r0, #0xb1
	lsls r0, r0, #1
	b _0801065C
	.align 2, 0
_08010634: .4byte gUnknown_08499590
_08010638: .4byte 0x0000417A
_0801063C: .4byte 0x00000A22
_08010640:
	ldr r0, _08010650 @ =0x00000143
	cmp r1, r0
	beq _0801064C
	adds r0, #0x20
	cmp r1, r0
	bne _08010658
_0801064C:
	ldr r0, _08010654 @ =0x00000163
	b _0801065C
	.align 2, 0
_08010650: .4byte 0x00000143
_08010654: .4byte 0x00000163
_08010658:
	movs r0, #0xc0
	lsls r0, r0, #1
_0801065C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

