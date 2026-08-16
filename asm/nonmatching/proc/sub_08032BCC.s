	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032BCC
sub_08032BCC: @ 0x08032BCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov sl, r0
	movs r5, #0
	ldr r7, _08032C64 @ =gUnknown_08090D54
	ldr r0, _08032C68 @ =gUnknown_08090D58
	mov r8, r0
	ldr r3, [r7]
	movs r2, #0
_08032BE6:
	adds r0, r5, r3
	ldrb r1, [r0]
	strb r2, [r0]
	adds r5, #1
	cmp r5, #3
	ble _08032BE6
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #0xc]
	movs r0, #0x10
	movs r1, #1
	movs r2, #0xe
	movs r3, #4
	bl sub_0801A444
	bl sub_08013AEC
	bl sub_08013B0C
	movs r0, #0x45
	bl sub_0801F234
	movs r0, #0x46
	bl sub_0801F234
	ldr r0, _08032C6C @ =gUnknown_081D2224
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08032C70 @ =gUnknown_081D2554
	ldr r1, _08032C74 @ =0x06006000
	bl Decompress
	movs r5, #0
	ldr r6, _08032C78 @ =gUnknown_02027C2C
	ldr r0, _08032C7C @ =gUnknown_08613CDC
	mov sb, r0
_08032C36:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08032C80
	adds r0, r6, #0
	mov r1, sp
	bl sub_08031B6C
	ldr r1, [r7]
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	b _08032CAE
	.align 2, 0
_08032C64: .4byte gUnknown_08090D54
_08032C68: .4byte gUnknown_08090D58
_08032C6C: .4byte gUnknown_081D2224
_08032C70: .4byte gUnknown_081D2554
_08032C74: .4byte 0x06006000
_08032C78: .4byte gUnknown_02027C2C
_08032C7C: .4byte gUnknown_08613CDC
_08032C80:
	mov r0, r8
	ldr r4, [r0]
	ldr r0, [r4]
	ldrb r1, [r0, #9]
	ldr r0, _08032D24 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08032CB4
	mov r0, sb
	ldr r1, [r0]
	adds r0, r6, #0
	bl sub_0808B678
	ldr r1, [r7]
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r1, [r4]
_08032CAE:
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
_08032CB4:
	adds r6, #0x13
	adds r5, #1
	cmp r5, #2
	ble _08032C36
	movs r5, #2
	ldr r2, _08032D28 @ =gUnknown_0300449C
	ldr r1, _08032D2C @ =gUnknown_0849B060
_08032CC2:
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032CD0
	ldr r0, [r1]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
_08032CD0:
	subs r5, #1
	cmp r5, #0
	bge _08032CC2
	mov r1, r8
	ldr r4, [r1]
	ldr r1, [r4]
	movs r5, #0
	movs r0, #1
	strb r0, [r1, #0x10]
	bl sub_08032A00
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r0, [r4]
	strh r5, [r0, #0xe]
	bl sub_08032AFC
	bl sub_080328EC
	ldr r0, [r4]
	strh r5, [r0, #0xa]
	ldr r0, _08032D30 @ =gUnknown_0849B670
	movs r1, #0
	bl Proc_Start
	movs r0, #0
	bl sub_08063980
	ldr r0, _08032D34 @ =sub_08032B84
	bl sub_080638D0
	mov r0, sl
	str r5, [r0, #0x58]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032D24: .4byte gUnknown_0849B018
_08032D28: .4byte gUnknown_0300449C
_08032D2C: .4byte gUnknown_0849B060
_08032D30: .4byte gUnknown_0849B670
_08032D34: .4byte sub_08032B84

