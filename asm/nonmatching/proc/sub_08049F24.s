	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049F24
sub_08049F24: @ 0x08049F24
	push {r4, r5, r6, r7, lr}
	ldr r0, _08049F98 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x78
	bl __umodsi3
	lsrs r0, r0, #2
	movs r1, #0xf
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	ldr r1, _08049F9C @ =gUnknown_08131DEC
	adds r0, r0, r1
	ldr r1, _08049FA0 @ =0x0000026A
	movs r2, #2
	bl sub_08013664
	movs r4, #0
	ldr r7, _08049FA4 @ =gUnknown_0812A170
	ldr r6, _08049FA8 @ =gUnknown_0812A174
_08049F4E:
	movs r0, #0
	ldr r5, [r7]
	ldrb r1, [r5]
	cmp r4, r1
	bne _08049F5A
	movs r0, #1
_08049F5A:
	lsls r1, r4, #4
	adds r1, #0x10
	lsls r3, r4, #4
	adds r0, #2
	lsls r0, r0, #0xc
	orrs r3, r0
	movs r0, #0x60
	ldr r2, [r6]
	bl sub_0801BD00
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08049F4E
	ldr r2, _08049FAC @ =gUnknown_084C3800
	ldrb r0, [r5]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #4
	adds r3, #0x46
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r3, r0
	movs r0, #0x58
	movs r1, #0x60
	bl sub_0801BD00
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049F98: .4byte gUnknown_03004008
_08049F9C: .4byte gUnknown_08131DEC
_08049FA0: .4byte 0x0000026A
_08049FA4: .4byte gUnknown_0812A170
_08049FA8: .4byte gUnknown_0812A174
_08049FAC: .4byte gUnknown_084C3800

